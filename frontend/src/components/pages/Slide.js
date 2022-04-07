import React, { useEffect, useState }  from 'react';
import styled from 'styled-components';
import axios from 'axios';

export default function Slide({ img, currentslide }) {
  
  const [preferenceId, setPreferenceId] = useState();
  const [userPreference, setUserPreference] = useState();

  useEffect(() => {
    axios({
      method: 'get',
      url: 'http://j6d204.p.ssafy.io/api/accounts/user/',
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
    .then((res) => {
      console.log(res.data.preference_set[0].id);
      setPreferenceId(res.data.preference_set[0].id);
    })
    .catch((err) => {
      console.log('error');
    });

    axios({
      method: 'get',
      url: `http://j6d204.p.ssafy.io/api/accounts/preference/${preferenceId}/`,
      headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
    })
    .then((res) => {
      console.log(res.data.id);
      setUserPreference(res.data.id);
    })
    .catch((err) => {
      console.log('error');
    });
}, []);


  return (
      <span>
        <IMG src={img} />
          <div>
            {userPreference && userPreference.map((preference) => {
              return (
                <div>
                  <div>이름 : {preference.name}</div>
                  <div>성장 속도 : {preference.growth_rate}</div>
                  <div>물 주기 : {preference.watering}</div>
                  <div>관리 난이도 : {preference.manage_difficulty}</div>
                </div>
              );
            })}
          </div>
      </span>

  );
}

const IMG = styled.img`
  width: 500px;
  height: 500px;
`;
