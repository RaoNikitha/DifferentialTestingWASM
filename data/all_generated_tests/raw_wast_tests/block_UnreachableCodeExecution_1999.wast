;; 10. Configure a block where a deep chain of nested blocks uses both `br` and `br_if` to redirect flow control. An improper redirection misroutes to finishing the loop but encountering `unreachable` following the `end` instruction validation requires nested block précis adherence.

(assert_invalid
  (module 
    (func $nested-block-br (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_if 0 (i32.const 0))
            (br 1 (i32.const 42))
            (i32.const 1)
          )
          (br 0 (i32.const 2))
        )
        (i32.const 3)
      )
      (unreachable)
    )
  )
  "type mismatch"
)