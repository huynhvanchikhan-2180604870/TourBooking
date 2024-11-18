const calculateAvgRating = (reviews) => {
  // Calculate the total rating by summing all ratings from the reviews array
  const totalRating = reviews?.reduce((acc, item) => acc + item.rating, 0);

  // Calculate the average rating
  const avgRating = reviews?.length > 0 ? totalRating / reviews.length : "";

  return { totalRating, avgRating };
};

export default calculateAvgRating;
