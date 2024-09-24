;; Combine a complex structure with forward and backward branches where improper control flow could eventually lead to a cascade, terminating at an `unreachable` instruction. This test reviews how well structurally designed control flow rules handle complex multi-branch instructions.

(assert_invalid
  (module
    (func $complex-br_table
      (block $l0
        (loop $l1
          (block $l2 (result i32)
            (block $l3 (br_table 1 2 0 (i32.const 1)) (i32.const 0))
            (unreachable)
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)