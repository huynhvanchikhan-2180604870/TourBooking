import React, { useState, useEffect } from 'react';
import { Modal, Box, Typography, Button, TextField, List, ListItem, ListItemText } from '@mui/material';
import SockJS from 'sockjs-client';
import { Stomp } from '@stomp/stompjs';
import { API_BASE_URL } from '../config/api';

function ChatModal({ open, handleClose, hostName, userName }) {
    const [message, setMessage] = useState('');
    const [messages, setMessages] = useState([]);
    const [stompClient, setStompClient] = useState(null);
    const [isConnected, setIsConnected] = useState(false);

    useEffect(() => {
        if (open) {
            const socket = new SockJS(`${API_BASE_URL}/ws`);
            const client = Stomp.over(socket);
            client.connect({}, () => {
                client.subscribe('/topic/public', (msg) => {
                    const receivedMessage = JSON.parse(msg.body);
                    setMessages(prevMessages => [...prevMessages, receivedMessage]);
                });
            }, (error) => {
                console.error('Connection error:', error);
            });

            setStompClient(client);
            return () => client.disconnect();
        }
    }, [open]);

    const sendMessage = () => {
        if (message && isConnected && stompClient) {
            const chatMessage = { text: message, sender: 'user', type: 'CHAT' };
            stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
            setMessage('');
            setMessages([...messages, { ...chatMessage, sender: userName }]); // Optionally display immediately in the UI
        } else {
            console.error("Cannot send message. Either not connected or no client.");
        }
    };

    return (
        <Modal
            open={open}
            onClose={() => {
                handleClose();
                if (stompClient) {
                    stompClient.disconnect();
                    setIsConnected(false);
                }
            }}
            sx={{
                display: 'flex',
                alignItems: 'flex-end',
                justifyContent: 'flex-end',
                bottom: '20px',
            }}
        >
            <Box sx={{
                width: 400,
                height: 500,
                bgcolor: 'background.paper',
                border: 'none',
                outline: 'none',
                borderRadius: '13px',
                p: 2,
                maxHeight: '90vh',
                overflow: 'auto'
            }}>
                <Typography variant="h6" component="h2" className='mb-4'>
                    Chat with {hostName}
                </Typography>
                <hr />
                <List className='mb-5'>
                    {messages.map((msg, index) => (
                        <ListItem key={index} sx={{
                            justifyContent: msg.sender === userName ? 'flex-end' : 'flex-start'
                        }}>
                            <ListItemText primary={msg.text} sx={{
                                background: msg.sender === userName ? '#e0f7fa' : '#ffebee',
                                borderRadius: '10px',
                                padding: '6px 12px',
                                maxWidth: '75%',
                                border: msg.sender === userName ? '1px solid blue' : '1px solid red'
                            }} />
                        </ListItem>
                    ))}
                </List>
                <div className='mt-5 mb-1 bottom-0 mx-4 my-5'>
                    <TextField
                        fullWidth
                        variant="outlined"
                        label=""
                        value={message}
                        onChange={e => setMessage(e.target.value)}
                        sx={{ mt: 2 }}
                    />
                    <Button onClick={sendMessage} variant="contained" sx={{ mt: 2 }}>
                        Send
                    </Button>
                </div>
            </Box>
        </Modal>
    );
}

export default ChatModal;
