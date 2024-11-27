package com.hock.tour_booking.services;

import com.hock.tour_booking.dtos.BookingDTO;
import com.hock.tour_booking.entities.Report;
import com.hock.tour_booking.entities.Tour;
import com.hock.tour_booking.entities.User;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private UserService userService;
    @Autowired
    private TourService tourService;
    @Autowired
    private BookingService bookingService;

    public void sendVerificationCode(String toEmail, String code, String title) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject(title);
        message.setText(code);
        mailSender.send(message);
    }


    public void sendEmailWithBookingDetails(String toEmail, BookingDTO bookingDto) throws Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

        // Set recipient and subject
        helper.setTo(toEmail);
        helper.setSubject("Booking Confirmation - Order #" + bookingDto.getId());

        // Build the HTML email content
        String emailContent = buildBookingEmailContent(bookingDto);

        // Set the email content
        helper.setText(emailContent, true); // The second argument `true` indicates HTML content

        // Send the email
        mailSender.send(mimeMessage);
    }

    private String buildBookingEmailContent(BookingDTO bookingDto) throws Exception {
        User user = userService.findUserById(bookingDto.getUser());
        Tour tour = tourService.findTourById(bookingDto.getTour());

        // Tạo bảng hành trình tour
        StringBuilder itineraryTable = new StringBuilder();
        itineraryTable.append("<table style='width: 100%; border-collapse: collapse;'>");
        itineraryTable.append("<tr><th style='border: 1px solid #ddd; padding: 8px; text-align: left;'>Day</th>")
                .append("<th style='border: 1px solid #ddd; padding: 8px; text-align: left;'>Description</th></tr>");

        List<String> itinerary = tour.getItinerary();
        for (int i = 0; i < itinerary.size(); i++) {
            itineraryTable.append("<tr>")
                    .append("<td style='border: 1px solid #ddd; padding: 8px;'>Day ").append(i + 1).append("</td>")
                    .append("<td style='border: 1px solid #ddd; padding: 8px;'>").append(itinerary.get(i)).append("</td>")
                    .append("</tr>");
        }
        itineraryTable.append("</table>");

        // Tạo nội dung email
        return """
                <!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Booking Confirmation</title>
                </head>
                <body style="font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 0; background-color: #f9f9f9;">
                    <div style="max-width: 600px; margin: auto; background: #fff; padding: 20px; border: 1px solid #ddd;">
                        <h1 style="color: #333;">Thank you for booking with us!</h1>
                        <p>Dear <strong>%s</strong>,</p>
                        <p>We are pleased to confirm your booking with the following details:</p>
                        <ul>
                            <li><strong>Booking ID:</strong> %s</li>
                            <li><strong>Tour Name:</strong> %s</li>
                            <li><strong>Booking Date:</strong> %s</li>
                            <li><strong>Payment Status:</strong> %s</li>
                            <li><strong>Total Amount:</strong> %s VND</li>
                        </ul>
                        <h2 style="color: #333;">Tour Itinerary</h2>
                        %s
                        <h2 style="color: #333;">QR Code for Check-In</h2>
                        <img src="%s" alt="QR Code" style="display: block; margin: auto; max-width: 256px;" />
                        <p style="color: #555;">If you have any questions, please contact us at support@tourbooking.com.</p>
                        <p style="font-size: 14px; color: #999;">Thank you for choosing us!</p>
                    </div>
                </body>
                </html>
                """.formatted(
                user.getUsername(), // Tên người dùng
                bookingDto.getId(), // Booking ID
                tour.getTitle(), // Tên tour
                bookingDto.getBookingDate(), // Ngày đặt
                bookingDto.getPaymentStatus(), // Trạng thái thanh toán
                bookingDto.getTotalPrice(), // Tổng tiền
                itineraryTable.toString(), // Bảng hành trình
                bookingDto.getQrBase64() // QR Code dưới dạng Base64
        );
    }

    public void sendEmailReportToUser(String emailUser, Report report) throws Exception {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

        // Đặt thông tin người nhận và tiêu đề
        helper.setTo(emailUser);
        helper.setSubject("Xác nhận gửi báo cáo - Mã báo cáo: " + report.getId());

        // Tạo nội dung email
        String noiDungEmail = taoNoiDungEmailBaoCao(report);

        // Đặt nội dung email
        helper.setText(noiDungEmail, true); // Tham số `true` để xác định nội dung HTML

        // Gửi email
        mailSender.send(mimeMessage);
    }

    private String taoNoiDungEmailBaoCao(Report report) {
        // Định dạng ngày giờ theo dd-MM-yyyy và HH:mm
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

        // Định dạng ngày và thời gian từ createdAt
        String formattedDate = report.getCreatedAt().format(dateFormatter);
        String formattedTime = report.getCreatedAt().format(timeFormatter);

        // Chuẩn bị danh sách lý do báo cáo
        StringBuilder lyDo = new StringBuilder();
        if (report.isDescriptionMismatch()) {
            lyDo.append("<li>Tour không đúng như mô tả</li>");
        }
        if (report.isScheduleMismatch()) {
            lyDo.append("<li>Lịch trình tour không giống hợp đồng</li>");
        }
        if (report.isOverpricing()) {
            lyDo.append("<li>Kê giá</li>");
        }
        if (report.isGuideAttitude()) {
            lyDo.append("<li>Hướng dẫn viên có thái độ không tốt</li>");
        }
        if (report.isGuideOther()) {
            lyDo.append("<li>Hướng dẫn viên không chuyên nghiệp</li>");
        }
        if (report.isOther()) {
            lyDo.append("<li>Lý do khác: ").append(report.getOtherReason()).append("</li>");
        }

        return """
            <!DOCTYPE html>
            <html lang="vi">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Xác nhận gửi báo cáo</title>
            </head>
            <body style="font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 0; background-color: #f9f9f9;">
                <div style="max-width: 600px; margin: auto; background: #fff; padding: 20px; border: 1px solid #ddd;">
                    <h1 style="color: #333;">Báo cáo của bạn đã được gửi thành công!</h1>
                    <p>Xin chào quý khách,</p>
                    <p>Chúng tôi đã nhận được báo cáo của bạn cho tour:</p>
                    <ul>
                        <li><strong>Tên tour:</strong> %s</li>
                        <li><strong>Mã báo cáo:</strong> %s</li>
                        <li><strong>Ngày báo cáo:</strong> %s</li>
                        <li><strong>Thời gian:</strong> %s</li>
                    </ul>
                    <h2 style="color: #333;">Chi tiết lý do báo cáo:</h2>
                    <ul>
                        %s
                    </ul>
                    <p style="color: #555;">Chúng tôi xin lỗi vì những bất tiện mà bạn đã gặp phải. Đội ngũ của chúng tôi sẽ xem xét báo cáo này và xử lý nhanh nhất có thể.</p>
                    <p style="color: #555;">Nếu cần hỗ trợ thêm, vui lòng liên hệ chúng tôi qua email: support@tourbooking.com.</p>
                    <p style="font-size: 14px; color: #999;">Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>
                </div>
            </body>
            </html>
            """.formatted(
                report.getTourReport().getTitle(), // Tên tour
                report.getId(), // Mã báo cáo
                formattedDate, // Ngày báo cáo định dạng dd-MM-yyyy
                formattedTime, // Thời gian định dạng HH:mm
                lyDo.toString() // Danh sách lý do
        );
    }

}
