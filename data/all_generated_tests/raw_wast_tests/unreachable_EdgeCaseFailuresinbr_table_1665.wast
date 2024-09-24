;; 6. **Test Case 6:** Embed an `unreachable` instruction within a called function which contains a `br_table`. Test if the function call correctly induces a trap, preventing the `br_table` from external function contexts. \    _Constraint Checked: Function scope trapping affects outer calling sequences efficiently._

(assert_invalid
  (module
    (func $type-unreachable-in-function-call (result f32)
      (call $trapping_function)
      (br_table 0 1 0 (i32.const 1))
    )
    (func $trapping_function
      (unreachable)
    )
  )
  "type mismatch"
)