;; 3. **Indirect Branch with Out-of-Bounds Index**    - Test a `br_table` instruction that branches to a default target when the index is out of bounds. This checks correct default label resolution within a loop, ensuring it doesn't misresolve to inner blocks.

(assert_invalid
  (module
    (func $indirect-branch-out-of-bounds
      (result i32)
      (local i32)
      (block $default $label1
        (loop $loop1 (result i32)
          (br_table $label1 $loop1 $default (local.get 0))
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)