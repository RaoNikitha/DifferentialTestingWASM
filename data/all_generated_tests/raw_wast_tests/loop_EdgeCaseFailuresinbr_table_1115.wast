;; - **Test 6**: Implement a `br_table` inside a loop where the table targets itself and an additional valid target. Use an index equal to the length of the table, and confirm how both engines transition to their respective default targets and produce the correct outcome or error message.

(assert_invalid
  (module
    (func $br_table_in_loop
      (loop $loop
        (block $block
          (br_table $loop $block (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)