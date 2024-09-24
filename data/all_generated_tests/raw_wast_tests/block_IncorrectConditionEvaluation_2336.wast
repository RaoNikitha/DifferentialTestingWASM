;; 7. Design a block that involves counter-controlled loops with `br_if` conditions based on the counter reaching a fixed number. Check if premature breaks occur, revealing conditional check flaws in repetitive constructs.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (i32.const 10)
      (set_local 0)
      (block $outer (result i32)
        (loop $loop
          (br_if $outer (i32.eqz (get_local 0)))
          (set_local 0 (i32.sub (get_local 0) (i32.const 1)))
          (br $loop)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)