import React, { useState, useEffect } from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button, Modal, Box, Typography } from '@mui/material';
import ChatModal from './ChatModal'; // Import the ChatModal component you created previously
import { API_BASE_URL } from '../../../../config/api';
import { useSelector } from 'react-redux';

function MessageManger() {
    const [chats, setChats] = useState([]);
    const [selectedChat, setSelectedChat] = useState(null);
    const [openModal, setOpenModal] = useState(false);
    const { auth } = useSelector((state) => state);
    useEffect(() => {
        fetchChats();
    }, []);

    const fetchChats = async () => {
        // Replace with your actual fetch call
        const response = await fetch(`${API_BASE_URL}/chats`);
        const data = await response.json();
        setChats(data);
    };

    const handleOpenChat = (chat) => {
        setSelectedChat(chat);
        setOpenModal(true);
    };

    const handleCloseModal = () => {
        setOpenModal(false);
    };

    return (
        <div>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Chat ID</TableCell>
                            <TableCell>User Name</TableCell>
                            <TableCell>Last Message</TableCell>
                            <TableCell>Respond</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {chats.map((chat) => (
                            <TableRow key={chat.id}>
                                <TableCell>{chat.id}</TableCell>
                                <TableCell>{chat.userName}</TableCell>
                                <TableCell>{chat.lastMessage}</TableCell>
                                <TableCell>
                                    <Button variant="contained" color="primary" onClick={() => handleOpenChat(chat)}>
                                        Respond
                                    </Button>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            {selectedChat && (
                <ChatModal
                    open={openModal}
                    handleClose={handleCloseModal}
                    hostName={auth.user.username} // This should be dynamic depending on your context
                    userName={selectedChat.userName}
                />
            )}
        </div>
    );
}

export default MessageManger;
