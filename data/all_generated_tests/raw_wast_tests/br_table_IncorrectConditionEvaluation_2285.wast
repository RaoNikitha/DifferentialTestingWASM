;; 5. **Test Description:** Insert a `br_table` instruction within a loop structure, breaking the loop conditionally based on stack operand values. Alter conditions to ensure the loop break only occurs under exact operand matches. The test evaluates correct condition evaluation causing the loop's end.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "unknown label"
)