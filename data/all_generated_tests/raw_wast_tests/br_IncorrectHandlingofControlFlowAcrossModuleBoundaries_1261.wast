;; 2. **Nested Imports with Br to Outer Block:**    Develop a test involving nested calls to imported functions. The second imported function should include a `br` instruction that targets an outer block in the main module to verify correct relative label indexing and out-of-bounds protection.

(assert_invalid
  (module
    (import "env" "func1" (func $func1))
    (import "env" "func2" (func $func2))
    (func (result i32)
      (block $outer (result i32)
        (call $func1)
        (block (call $func2) (br 1))
        (i32.const 0)
      )
    )
  )
  "undefined result type"
)