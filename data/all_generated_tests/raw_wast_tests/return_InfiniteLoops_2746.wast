;; 5. **Immediate Return inside Loop with Memory Operations**: Integrate memory operations within a loop, followed by a conditional `return`. Verify if both WebAssembly and Wizard Engine correctly handle the stack after memory operations without causing an infinite loop due to memory-load related interruptions.

(assert_invalid
  (module
    (memory 1)
    (func (result i32)
      (loop (block (result i32)
        (i32.const 0)
        (i32.load)
        (br_if 0 (i32.const 0))
        (return (i32.const 1))
      ))
    )
  )
  "type mismatch"
)