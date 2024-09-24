;; 5. **Test Description:** Place `unreachable` inside a `loop` that contains various blocks and a `br_table`, checking if the `br_table` correctly resolves the appropriate targets.    *Constraint Checked:* Correct resolution of targets within a complex control flow using `br_table`.    *Relation to Incorrect Branch Target Resolution:* Tests accurate target lookup in `br_table` amidst potential complex control flow.

(assert_invalid
  (module 
    (func $test-unreachable-loop-br_table
      (block $outer
        (loop $inner
          (block (br 1)) 
          (block 
            (block 
              (block (br_table 0 1 2 0 (i32.const 3)) (unreachable))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)