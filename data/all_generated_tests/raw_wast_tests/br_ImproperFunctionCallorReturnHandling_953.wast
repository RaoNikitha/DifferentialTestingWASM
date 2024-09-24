;; 4. **Test 4: Using `br` with Indirect Function Call in a Loop**    - **Description:** Perform an indirect function call within a loop enclosed by a `br` instruction, targeting the loop's start. Verify if the function and loop interoperation correctly restores the control flow.    - **Reasoning:** Checks if backward branches properly handle loop restarts combined with function calls.

(assert_invalid
  (module
    (func $indirect_call_loop
      (block $outer
        (loop $inner
          (call_indirect (type $functype) (i32.const 0))
          (br $inner)
        )
      )
    )
    (type $functype (func))
  )
  "indirect call within loop with br"
)