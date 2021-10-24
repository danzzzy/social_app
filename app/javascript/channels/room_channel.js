import consumer from "./consumer";

const initChatroomCable = () => {
  const postsContainer = document.getElementById('posts');
  if (postsContainer) {
    const id = postsContainer.dataset.roomId;

    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        // console.log(data)
        postsContainer.insertAdjacentHTML('afterbegin', data);
      }
    });
  }
}

export { initChatroomCable };
