;; 10. **Test Description 10**: Develop a test scenario with a loop containing an erroneous nested block where `br_table` unexpectedly targets an invalid index. Position an `unreachable` instruction immediately after the loop to observe incorrect target handling causing program execution to hit `unreachable`.

(assert_invalid
  (module (func $br_table_invalid_index
    (result i32) (loop (block (br_table 1 0 (i32.const 0)))) (unreachable))
  )
  "br_table target index out of bounds"
)