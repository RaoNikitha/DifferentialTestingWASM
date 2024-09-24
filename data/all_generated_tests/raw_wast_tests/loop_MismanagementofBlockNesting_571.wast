;; 2. **Invalid Loop Block Referencing Incorrect Label**:    Construct a test with multiple nested loops and an incorrect label reference via `br\_if` within an inner loop.    This checks if the label indexing is correctly handled, ensuring branches point to the correct loop blocks.

(assert_invalid
  (module (func $invalid-label-reference
    (block (loop (result i32) 
      (br_if 1 (i32.const 1))
    ))
  ))
  "Invalid label reference"
)