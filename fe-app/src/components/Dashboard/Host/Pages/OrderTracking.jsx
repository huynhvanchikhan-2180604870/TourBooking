import {
  Button,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";
import { amber, blue, green, red } from "@mui/material/colors";
import React, { useState } from "react";
import UpdateBookingModal from "./UpdateBookingModal"; // Import modal cập nhật

// Màu sắc trạng thái đặt tour
const statusColors = {
  PENDING: amber[500],
  APPROVED: green[500],
  CANCELLED: red[500],
  ONGOING: blue[500],
};

// Dịch trạng thái sang tiếng Việt
const translate = {
  PENDING: "Đang chờ duyệt",
  APPROVED: "Đã duyệt",
  CANCELLED: "Đã hủy",
  ONGOING: "Đang tiến hành",
  PAID: "Đã thanh toán",
  UNPAID: "Chưa thanh toán",
  REFUNDED: "Đã hoàn tiền",
  NOT_REFUNDED: "Chưa hoàn tiền",
};

// Component OrderTracking
const OrderTracking = () => {
  const [bookings, setBookings] = useState([
    // Add a tickets field to each booking
    {
      bookingId: "B001",
      tourName: "Tour Đà Lạt",
      bookingDate: "2024-01-01",
      totalPrice: 1500000,
      paymentMethod: "ZALOPAY",
      paymentStatus: "PAID",
      bookingStatus: "APPROVED",
      refundStatus: null,
      tickets: 2,
    },
    {
      bookingId: "B002",
      tourName: "Tour Nha Trang",
      bookingDate: "2024-02-15",
      totalPrice: 2500000,
      paymentMethod: "VNPAY",
      paymentStatus: "UNPAID",
      bookingStatus: "PENDING",
      refundStatus: null,
      tickets: 5,
    },
    {
      bookingId: "B003",
      tourName: "Tour Phú Quốc",
      bookingDate: "2024-03-10",
      totalPrice: 3000000,
      paymentMethod: "BANKING",
      paymentStatus: "PAID",
      bookingStatus: "ONGOING",
      refundStatus: null,
      tickets: 3,
    },
    {
      bookingId: "B004",
      tourName: "Tour Hội An",
      bookingDate: "2024-04-05",
      totalPrice: 1200000,
      paymentMethod: "ZALOPAY",
      paymentStatus: "PAID",
      bookingStatus: "CANCELLED",
      refundStatus: "NOT_REFUNDED",
      tickets: 1,
    },
    {
      bookingId: "B005",
      tourName: "Tour Sapa",
      bookingDate: "2024-05-20",
      totalPrice: 1800000,
      paymentMethod: "VNPAY",
      paymentStatus: "UNPAID",
      bookingStatus: "CANCELLED",
      refundStatus: "REFUNDED",
      tickets: 4,
    },
    {
      bookingId: "B006",
      tourName: "Tour Huế",
      bookingDate: "2024-06-15",
      totalPrice: 2100000,
      paymentMethod: "BANKING",
      paymentStatus: "PAID",
      bookingStatus: "APPROVED",
      refundStatus: null,
      tickets: 2,
    },
    {
      bookingId: "B007",
      tourName: "Tour Mỹ Tho",
      bookingDate: "2024-07-22",
      totalPrice: 1300000,
      paymentMethod: "ZALOPAY",
      paymentStatus: "UNPAID",
      bookingStatus: "PENDING",
      refundStatus: null,
      tickets: 3,
    },
    {
      bookingId: "B008",
      tourName: "Tour Đà Nẵng",
      bookingDate: "2024-08-30",
      totalPrice: 2900000,
      paymentMethod: "VNPAY",
      paymentStatus: "PAID",
      bookingStatus: "ONGOING",
      refundStatus: null,
      tickets: 2,
    },
    {
      bookingId: "B009",
      tourName: "Tour Quy Nhơn",
      bookingDate: "2024-09-10",
      totalPrice: 3200000,
      paymentMethod: "BANKING",
      paymentStatus: "UNPAID",
      bookingStatus: "CANCELLED",
      refundStatus: "NOT_REFUNDED",
      tickets: 2,
    },
    {
      bookingId: "B010",
      tourName: "Tour Cần Thơ",
      bookingDate: "2024-10-05",
      totalPrice: 2200000,
      paymentMethod: "ZALOPAY",
      paymentStatus: "PAID",
      bookingStatus: "APPROVED",
      refundStatus: null,
      tickets: 3,
    },
  ]);

  const [selectedBooking, setSelectedBooking] = useState(null);
  const [isModalOpen, setModalOpen] = useState(false);

  const openModal = (booking) => {
    setSelectedBooking(booking);
    setModalOpen(true);
  };

  const closeModal = () => {
    setSelectedBooking(null);
    setModalOpen(false);
  };

  const updateBookingStatus = (bookingId, newStatus) => {
    setBookings((prev) =>
      prev.map((b) =>
        b.bookingId === bookingId ? { ...b, bookingStatus: newStatus } : b
      )
    );
    closeModal();
  };

  const refundBooking = (bookingId) => {
    setBookings((prev) =>
      prev.map((b) =>
        b.bookingId === bookingId ? { ...b, refundStatus: "REFUNDED" } : b
      )
    );
    closeModal();
  };

  return (
    <div>
      <TableContainer
        component={Paper}
        style={{
          border: "1px solid #FFCFB3",
          borderRadius: "14px",
          boxShadow:
            "rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px",
        }}
      >
        <h1
          className="mt-2 text-center"
          style={{
            fontFamily: "Island Moments, cursive",
            fontSize: "50px",
            color: "#FFCFB3",
            fontWeight: "700",
          }}
        >
          Quản lý đơn hàng
        </h1>
        <hr />
        <Table>
          <TableHead>
            <TableRow>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                ID
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Tên Tour
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Ngày Đặt
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Tổng Giá
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Phương Thức Thanh Toán
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Trạng Thái Thanh Toán
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Trạng Thái Đặt Tour
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Số Vé Đặt
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Trạng Thái Hoàn Tiền
              </TableCell>
              <TableCell className="text-center" style={{ fontWeight: "700" }}>
                Thao Tác
              </TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {bookings.map((row) => (
              <TableRow key={row.bookingId} className="text-center">
                <TableCell className="text-center">{row.bookingId}</TableCell>
                <TableCell className="text-center">{row.tourName}</TableCell>
                <TableCell className="text-center">{row.bookingDate}</TableCell>
                <TableCell className="text-center">
                  {`${row.totalPrice.toLocaleString()} VND`}
                </TableCell>
                <TableCell className="text-center">
                  {row.paymentMethod}
                </TableCell>
                <TableCell className="text-center">
                  {translate[row.paymentStatus]}
                </TableCell>
                <TableCell
                  className="text-center"
                  style={{
                    backgroundColor: statusColors[row.bookingStatus],
                    color: "#fff",
                    borderRadius: "14px",
                    padding: "10px",
                  }}
                >
                  {translate[row.bookingStatus]}
                </TableCell>
                <TableCell className="text-center">{row.tickets}</TableCell>
                <TableCell className="text-center">
                  {row.bookingStatus === "CANCELLED"
                    ? translate[row.refundStatus || "NOT_REFUNDED"]
                    : "N/A"}
                </TableCell>
                <TableCell className="text-center">
                  <Button
                    variant="contained"
                    color="primary"
                    onClick={() => openModal(row)}
                  >
                    Cập nhật
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      {selectedBooking && (
        <UpdateBookingModal
          open={isModalOpen}
          handleClose={closeModal}
          booking={selectedBooking}
          updateBooking={updateBookingStatus}
          refundBooking={refundBooking}
        />
      )}
    </div>
  );
};

export default OrderTracking;
