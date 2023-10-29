enum SubscriptionDuration {
  week,
  month,
  year,
}

SubscriptionDuration durationFromString(String duration) {
  SubscriptionDuration newDuration = SubscriptionDuration.week;

  if (duration == "week") {
    return newDuration;
  }

  if (duration == "month") {
    return SubscriptionDuration.month;
  }

  if (duration == "year") {
    return SubscriptionDuration.year;
  }

  return newDuration;
}
