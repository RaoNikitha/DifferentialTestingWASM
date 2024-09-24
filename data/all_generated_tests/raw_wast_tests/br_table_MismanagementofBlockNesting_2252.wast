;; Test2: Implement a nested loop structure where the `br_table` instruction targets multiple depths incorrectly, including the deepest block label. Expect `wizard_engine` to raise an error due to label arity mismatch, whereas WebAssembly should attempt execution and potentially trap due to incorrect control transfer.

(assert_invalid
  (module (func
    (block (loop
      (block (result i32)
        (block (result i64)
          (br_table 0 1 2 (i32.const 3)) 
        )
      )
    ))
  ))
  "label index out of bounds"
)