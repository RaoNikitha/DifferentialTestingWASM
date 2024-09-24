;; 2. **Test Description**: Design a `br_if` instruction targeting a nested `block`. Place it within another `block` and before the nested `block` starts, use a `br_table` with an out-of-bounds index. Ensure `wizard_engine` correctly fetches label arguments and handles `br_table` correctly whereas WASM may behave unpredictably.

(assert_invalid
  (module
    (func $diff-test
      (block
        (br_table 1 2 3 (i32.const 10))
        (block (br_if 0 (i32.const 1)))
      )
    )
  )
  "index out of bounds"
)