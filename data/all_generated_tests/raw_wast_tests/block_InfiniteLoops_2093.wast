;; Create tests where an outer `block` includes a `loop` that uses `br` to jump to a label outside the loop but within the block, ensuring `pushControl` maintains stack integrity and WebAssembly does not mismanage the stack causing infinite loops.

(assert_invalid
  (module (func $test-block-loop-br-infinite (result i32)
    (block (result i32)
      (loop
        (br 1)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)