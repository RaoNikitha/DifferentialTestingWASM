;; - Test 1: Create a function that calls another function but includes a branching instruction (`br`) that jumps to a block within the caller that is meant to process returned results. Verify if the call returns to the correct block.

(assert_invalid
  (module
    (func (result i32)
      (call $callee)
      (block (result i32) (br 0 (i32.const 10)))
    )
    (func $callee (result i32) (i32.const 5))
  )
  "incorrect branching behavior"
)