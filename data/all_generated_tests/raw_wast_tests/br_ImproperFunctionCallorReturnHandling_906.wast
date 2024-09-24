;; 7. **Nested Br within Function Chain:**    Chain multiple function calls where each function includes a nested control block with a `br` instruction. This tests if the proper control flow is maintained across the entire chain, particularly focusing on stack unwinding and valid function returns.

(assert_invalid
  (module
    (func $nested_br_in_function_chain
      (block
        (call $func1)))

    (func $func1
      (block
        (block
          (br 1)
          (call $func2))))
        
    (func $func2
      (block
        (loop
          (br 2)))))
  "unknown label"
)