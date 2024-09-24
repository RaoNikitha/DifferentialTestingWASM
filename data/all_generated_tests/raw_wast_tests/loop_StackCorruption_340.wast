;; 1. **Test Backward Branch with Complex Stack Operations**    - Construct a loop that contains multiple stack manipulations (`local.set`, `local.get`, `i32.add`, etc.) before and after a branching `br` instruction. Check if the stack height is consistent and valid when the loop is branched back.

(assert_invalid
  (module
    (func $complex-stack-loop (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.const 0))
      (loop $loop (param i32) (result i32)
        (local.get 0)
        (local.get 1)
        (i32.add)
        (local.set 1)
        (local.get 1)
        (i32.const 10)
        (i32.lt_s)
        (br_if $loop)
        (local.get 1)
      )
    )
  )
  "type mismatch"
)