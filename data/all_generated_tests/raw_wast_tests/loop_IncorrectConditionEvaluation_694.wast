;; Construct a `loop` block where `br_if` checks a stack value that results from a computation inside the `loop`. Ensure conditions like `x * y == z` are correctly evaluated to avoid incorrect branching.

(assert_invalid
  (module
    (func $complex-branching-condition
      (param i32 i32 i32) (result i32)
      (local.get 0)
      (local.get 1)
      (local.get 2)
      (i32.mul)
      (local.get 2)
      (i32.eq)
      (loop (result i32)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)