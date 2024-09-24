;; Test a `block` containing an instruction sequence that manipulates the stack in complex ways, followed by a `br_if` which conditionally branches based on the state of the stack. Check for proper stack unwinding and condition evaluation, ensuring no unexpected branching occurs.

(assert_invalid
  (module (func $complex-block-stack-manipulation-br_if
    (block (result i32)
      (i32.const 1) (i32.const 2)
      (i32.add)
      (block (br_if 0 (i32.const 0)))
      (i32.const 3)
    )
  ))
  "stack height mismatch"
)