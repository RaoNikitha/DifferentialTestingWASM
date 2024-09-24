;; 4. **Test: Module with Loop Block and Nop Before Loop Exit**    - Create Module A to export a function that runs a loop and executes a `nop` just before the loop exits. Module B should import and call this function. Validate the loop control flow and stack state post-exit.    - **Constraint Check**: Ensures `nop` does not interfere with looping within imported function contexts.    - **Relation to Differential Handling**: Respective initialization contexts mishandling may show erroneous loop handling in wizard_engine.

(assert_invalid
  (module
    (func $check_nop_within_loop
      (loop $exit
        nop
        (br $exit)
      )
    )
  )
  "invalid instruction"
)