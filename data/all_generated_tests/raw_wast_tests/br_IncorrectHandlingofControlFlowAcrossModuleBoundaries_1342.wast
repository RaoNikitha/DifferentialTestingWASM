;; 3. **Test Description:** Create two modules: one calls an exported function from the other, with nested blocks and `br` instructions targeting these blocks. Check whether the branch behavior is maintained correctly after the function call.    - **Constraint:** Verifies correct label indexing across nested structured control instructions in cross-module calls.    - **Relation:** Examines if label indices are correctly interpreted when branches target blocks in different modules.

(assert_invalid
  (module
    (import "env" "external_fn" (func $external_fn (param i32) (result i32)))
    (func $test
      (block $outer
        (block $inner
          (call $external_fn (br $outer))
        )
      )
    )
  )
  "type mismatch"
)