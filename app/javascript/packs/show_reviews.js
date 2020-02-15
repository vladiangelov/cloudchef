const showReviews = () => {
  // Select the show reviews button
  const reviewInfoButton = document.getElementById('show-reviews-button');
  const reviews = document.getElementById('card-reviews-id');
  // Add an event listener for a click
  reviewInfoButton.addEventListener("click", (event) => {
    console.log(reviews);
    reviews.classList.toggle("card-reviews");
    reviews.classList.toggle("card-reviews-visible");
  });
};
export { showReviews };
