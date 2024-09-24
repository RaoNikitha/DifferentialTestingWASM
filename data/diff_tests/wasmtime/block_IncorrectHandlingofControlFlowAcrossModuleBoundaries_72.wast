;; 3. **Branch Instruction to Import Call-Site**:    - Define a block that calls an imported function and immediately follows it with a branch instruction targeting the block. This tests if the correct control flow is maintained back to the calling module when branching.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func (result i32)
      (block (result i32)
        (call $external_func)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)