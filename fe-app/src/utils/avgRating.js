const calculateAvgRating = (reviews) => {
  console.log(reviews);
  // Calculate the total rating by summing all ratings from the reviews array
  const totalRating = reviews?.reduce((acc, item) => acc + item.rating, 0);
  console.log(totalRating);

  // Calculate the average rating
  const avgRating = reviews?.length > 0 ? totalRating / reviews.length : "";
  console.log(avgRating);

  return { totalRating, avgRating };
};

export default calculateAvgRating;
