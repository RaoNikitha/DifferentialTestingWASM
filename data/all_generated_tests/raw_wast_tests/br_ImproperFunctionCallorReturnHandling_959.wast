;; 10. **Test 10: `br` within Function Call Chain Leading to Outer Block**     - **Description:** Create a chain of function calls within nested blocks, ending with a `br` instruction targeting an outermost block. Assess operand stack consistency after each return and branch.     - **Reasoning:** Evaluates overall control flow robustness through multiple nested levels and function call interactions.

(assert_invalid
  (module 
    (func $outerBlock 
      (block $outer 
        (call $func1)
        (br $outer)
      )
    )
    (func $func1 
      (call $func2)
    )
    (func $func2 
      (block 
        (br 2)
      )
    )
  )
  "unknown label"
)