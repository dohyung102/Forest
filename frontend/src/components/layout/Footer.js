import React from 'react';

import Box from '@mui/material/Box';
import Container from '@mui/material/Container';

const Footer = () => {
  return (
    <Box sx={{ my: 6, display: { xs: 'none', md: 'flex' } }}>
      <Container maxWidth="md" height="100%" disableGutters>
        <Box>test</Box>
      </Container>
    </Box>
  );
};

export default Footer;
