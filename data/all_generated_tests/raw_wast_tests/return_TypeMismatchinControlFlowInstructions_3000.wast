;; A sequence where a loop contains another block with a return instruction, inconsistently returning a type as per function returns, examining type stack polymorphism handling across nested stacks.

(assert_invalid
  (module
    (func $nested-loop-return-type-mismatch (result i32)
      (loop (block (br 0) (return))) 
      (i32.const 0)
    )
  )
  "type mismatch"
)