import CloseIcon from "@mui/icons-material/Close";
import { Box, IconButton, Modal, Typography } from "@mui/material";
import { QRCodeCanvas } from "qrcode.react";
import React, { useEffect } from "react";
import "./order-tracking-modal.css";

const OrderTrackingModal = ({ open, handleClose, item }) => {
  const qrValue =
    `- Booking ID: ${item.id}\n` +
    `- Tour ID: ${item.tour}\n` +
    `- User ID: ${item.user}\n` +
    `- Payment Status: ${item.paymentStatus}`;

  useEffect(() => {
    const canvas = document.querySelector("canvas");
    const dataUrl = canvas?.toDataURL();
  }, []);
  return (
    <Modal
      open={open}
      onClose={handleClose}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box
        sx={{
          position: "absolute",
          top: "50%",
          left: "50%",
          transform: "translate(-50%, -50%)",
          width: 400,
          bgcolor: "background.paper",
          border: "none",
          boxShadow: 24,
          borderRadius: "13px",
          p: 4,
        }}
      >
        <IconButton
          aria-label="close"
          onClick={handleClose}
          sx={{
            position: "absolute",
            right: 8,
            top: 8,
            color: (theme) => theme.palette.grey[500],
          }}
        >
          <CloseIcon />
        </IconButton>
        <Typography
          id="modal-modal-title"
          variant="h5"
          component="h2"
          sx={{ mt: 2 }}
          className="text-center"
        >
          Thanks for your booked
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }} className="">
          Payment method: <span className="ms-4">{item.paymentMethod}</span>
        </Typography>
        <Box sx={{ my: 2 }}>
          <Typography gutterBottom>
            Guest: <span className="">{item.numPeople}</span>
          </Typography>
          <Typography gutterBottom>
            Status: <span className="">{item.bookingStatus}</span>{" "}
          </Typography>
          <Typography gutterBottom>
            Booking date <span>{item.bookingDate}</span>
          </Typography>
          <Typography gutterBottom>
            {" "}
            <b>
              Total - $<span>{item.totalPrice}</span>
            </b>{" "}
          </Typography>
        </Box>
        <hr />
        <h5 className="text-center">QR checkin</h5>
        <div className="qr__checkin text-center">
          <QRCodeCanvas
            value={qrValue}
            size={256}
            level="H" // Error correction level: L, M, Q, H
            includeMargin={true}
          />
        </div>
        <div className="text-center mt-4 btn__download">
          <button>Download</button>
        </div>
      </Box>
    </Modal>
  );
};

export default OrderTrackingModal;
