;; 5. **Test Description**: Implement a sequence where invalid `br` instructions have deliberately out-of-bound label targets, like `br 5` in a context with fewer than five labels.    - **Constraint**: Ensures robust handling of invalid label indices and prevents out-of-bound errors in the CFG.

(assert_invalid
  (module (func
    (block (br 5))
  ))
  "unknown label"
)