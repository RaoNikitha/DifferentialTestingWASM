;; 7. Export a function containing a `block` that `br_if` conditionally branches based on an imported function’s result. Validate the consistency of stack and control flow after the conditional branch.

(assert_invalid
  (module
    (func (import "env" "externalFunc") (result i32))
    (func (export "testBlockBrIf")
      (block (result i32)
        (br_if 0 (call 0))
        (i32.const 1)
      )
      (drop)
    )
  )
  "type mismatch"
)