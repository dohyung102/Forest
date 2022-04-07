import React from 'react';
// import styled from 'styled-components';
import ToggleButton from '@mui/material/ToggleButton';
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import SendIcon from '@mui/icons-material/Send';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import { useNavigate } from 'react-router-dom';

import axios from 'axios';

const Survey = () => {
  const navigate = useNavigate();
  const onClickHome = () => {
    navigate(`/`);
  };
  const [watering, setWatering] = React.useState('');
  const [flowerPresence, setFlowerPresence] = React.useState('');
  const [manageDifficulty, setManageDifficulty] = React.useState('');
  const [growthRate, setGrowthRate] = React.useState('');
  const [placement, setPlacement] = React.useState('');

  const wateringHandleChange = (event, newWatering) => {
    // let waterTemp = newWatering.join().toString();
    setWatering(newWatering);
    console.log(newWatering)
  };

  const flowerPresenceHandleChange = (event, newFlowerPresence) => {
    setFlowerPresence(newFlowerPresence);
    console.log(newFlowerPresence)
  };

  const manageDifficultyHandleChange = (event, newManageDifficulty) => {
    setManageDifficulty(newManageDifficulty);
    console.log(newManageDifficulty)
  };

  const growthRateHandleChange = (event, newGrowthRate) => {
    setGrowthRate(newGrowthRate);
    console.log(newGrowthRate)
  };

  const placementHandleChange = (event, newPlacement) => {
    setPlacement(newPlacement);
    console.log(newPlacement)
  };

  const survey = () => {
    axios({
      method: 'post',
      url: 'http://j6d204.p.ssafy.io/api/accounts/preference/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`
      },
      data: {
        watering: watering.join(),
        flower_presence: flowerPresence.join(),
        manage_difficulty: manageDifficulty.join(),
        growth_rate: growthRate.join(),
        placement: placement.join(),
      },
    })
      .then((res) => {
        console.log(res)
        alert('survey completed')
        navigate('/recommend')
      })
      .catch((err) => {
        console.log(err)
      })
  }

  return (
    <div>
      <h1>선호하는 환경을 입력해주세요</h1>
      <h3>물 주기</h3>
      <ToggleButtonGroup
        color="primary"
        value={watering}

        onChange={wateringHandleChange}
      >
        <ToggleButton value="0">식물을 물 속에 두고 편하게 키우고 싶어요</ToggleButton>
        <ToggleButton value="1">한달에 한 두번 물을 주고 싶어요</ToggleButton>
        <ToggleButton value="2">주에 한 번 정도 물을 주고 싶어요</ToggleButton>
        <ToggleButton value="3">주에 두 번 정도는 물을 주는게 좋아요</ToggleButton>
        <ToggleButton value="4">매일 신경쓰면서 자주 물을 주는게 좋아요</ToggleButton>
      </ToggleButtonGroup>
      

      <h3>꽃의 유무</h3>
      <ToggleButtonGroup
        color="primary"
        value={flowerPresence}

        onChange={flowerPresenceHandleChange}
      >
        <ToggleButton value="0">있었으면 좋겠어요</ToggleButton>
        <ToggleButton value="1">없는 게 좋아요</ToggleButton>
        <ToggleButton value="2">상관없어요</ToggleButton>
      </ToggleButtonGroup>

      <h3>관리 난이도</h3>
      <ToggleButtonGroup
        color="primary"
        value={manageDifficulty}

        onChange={manageDifficultyHandleChange}
      >
        <ToggleButton value="0">쉬워요</ToggleButton>
        <ToggleButton value="1">보통이에요</ToggleButton>
        <ToggleButton value="2">어려워요</ToggleButton>
        <ToggleButton value="3">엄청 어려워요</ToggleButton>
      </ToggleButtonGroup>

      <h3>성장 빠르기</h3>
      <ToggleButtonGroup
        color="primary"
        value={growthRate}

        onChange={growthRateHandleChange}
      >
        <ToggleButton value="0">느린게 좋아요</ToggleButton>
        <ToggleButton value="1">평범한게 좋아요</ToggleButton>
        <ToggleButton value="2">빠른게 좋아요</ToggleButton>
      </ToggleButtonGroup>

      <h3>배치 장소</h3>
      <ToggleButtonGroup
        color="primary"
        value={placement}

        onChange={placementHandleChange}
      >
        <ToggleButton value="0">거실 안쪽에 두고 싶어요</ToggleButton>
        <ToggleButton value="1">거실 창가 쪽에 두고 싶어요</ToggleButton>
        <ToggleButton value="2">발코니 안쪽에 두고 싶어요</ToggleButton>
        <ToggleButton value="3">발코니 창가 쪽에 두고 싶어요</ToggleButton>
      </ToggleButtonGroup>

      <br></br><br></br><br></br><br></br>
      <Stack direction="row" spacing={2}>
        <Button variant="outlined" onClick={onClickHome} startIcon={<ArrowBackIcon />}>
          뒤로가기
        </Button>
        <Button variant="contained" onClick={survey} endIcon={<SendIcon />}>
          제출
        </Button>
      </Stack>
    </div>
  )
}

export default Survey;