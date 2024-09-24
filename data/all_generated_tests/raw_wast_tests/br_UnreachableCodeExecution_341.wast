;; 2. Design a WebAssembly module containing a deeply nested set of `loop` constructs, where the `br` instruction targets the outermost loop. Follow this with an `unreachable` instruction inside each loop. This test will verify label indexing in deep structures and whether the branch correctly targets outmost loops while avoiding premature execution of unreachable code.

(assert_invalid
  (module
    (func $deep-nested-loops
      (result i32)
      (loop $L1
        (loop $L2
          (loop $L3
            (block (br 2)) ;; Should branch to $L1
            unreachable
          )
          unreachable
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)