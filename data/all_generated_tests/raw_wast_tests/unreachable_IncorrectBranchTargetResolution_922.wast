;; 3. **Test Description:** Use `unreachable` inside an `if` block with an immediate `br` to the end of the outermost block, ensuring branching correctly jumps past the `if`.    *Constraint Checked:* Proper `if` block exit when nested within another block.    *Relation to Incorrect Branch Target Resolution:* Ensures reproducible branch target resolution that might be misstated by incorrect position tracking.

(assert_invalid
  (module (func $nested-if-unreachable
    (block
      (if (i32.const 1)
        (then (unreachable))
        (else (br 1))
      )
    )
  ))
  "type mismatch"
)