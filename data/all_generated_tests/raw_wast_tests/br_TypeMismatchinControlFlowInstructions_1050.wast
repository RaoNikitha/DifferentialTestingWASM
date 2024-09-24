;; 1. **Test 1: Mismatched Types in Simple Block**    - Construct a `block` that expects an `i32` type but contains a `br` instruction wrongly providing an `f32` type.    - Checks if the `br` instruction correctly validates type consistency within a `block`.    - Tests adherence to result type constraint of control flow instructions.

(assert_invalid
  (module
    (func $mismatched-types-in-block
      (block (result i32)
        (br 0 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)