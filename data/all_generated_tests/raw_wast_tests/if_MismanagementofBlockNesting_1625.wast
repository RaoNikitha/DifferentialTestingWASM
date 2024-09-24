;; Test 6: Design an `if` block within a `loop` block, incorporating nested `block`s and multiple `else` branches. Check the interaction among conditions and branches to ensure the correct block sequencing and avoidance of mismanaged stack heights.

(assert_invalid
  (module
    (func $nested-if-loop (result i32)
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (block (result i32)
              (if (result i32)
                (i32.const 0)
                (then (i32.const 2))
                (else (i32.const 3)))
              (i32.const 4))
            (br 1))
          (else (i32.const 5)))
      )
    )
  )
  "type mismatch"
)