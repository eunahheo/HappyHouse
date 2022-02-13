import { ImageList } from '@mui/material';
import React from 'react';
import MyCardCopy from './MyCardCopy';

const MyCardList = ({ itemList }) => {
  console.log(itemList);
  return (
    <div className="MyCardList">
      <div>
        <span>my card lisdddt</span>
        <ImageList cols={4}>
          {itemList.map((item) => (
            <MyCardCopy key={item.postSeq} item={item} />
          ))}
        </ImageList>
      </div>
    </div>
  );
};
export default MyCardList;
