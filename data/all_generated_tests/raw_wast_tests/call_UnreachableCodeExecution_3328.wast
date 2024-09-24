;; 7. **Test Description**:     - **Setup**: Function `main` calls an imported function with an invalid index, which should transition to an `unreachable` instruction.    - **Constraint**: Capture out-of-bounds function index in imported functions.    - **Reasoning**: Ensures proper index validation leading to unreachable in both engines.

(assert_invalid
  (module
    (import "env" "some_function" (func $imported_func))
    (func (call $imported_func (i32.const 1)) (nop) (i32.const 0))
  )
  "unknown function"
)