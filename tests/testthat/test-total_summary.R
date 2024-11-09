
# Create test dataframe

data <- data.frame(
  colour = rep(c("Red", "Blue", "Yellow"), each = 5),
  number = rnorm(15))

# Test 1 - Non-numeric variables result in errors

test_that("Non-numerical variable error", {
  expect_error(total_summary(data, summ_var = colour, na.rm = TRUE))
})

# Test 2 - Output is of expected class

test_that("Class of return from function", {
  expect_type(total_summary(data, colour, summ_var = number, na.rm = TRUE), "list")
})

# Test 3 - Output is visible

test_that("Output is visible", {
  expect_visible(total_summary(data, colour, summ_var = number, na.rm = TRUE))
})
