
const cards = document.querySelectorAll('.card');
const width = window.innerWidth;


cards.forEach((card) => {
  const description = card.firstElementChild.querySelector('p');
  if (width >= 768 && width < 992) {
    description.innerText = description.innerText.slice(0, 90);
  } else if ((width >= 992 && width < 1200) || width >= 1200) {
    description.innerText = description.innerText.slice(0, 62);
  }
});
