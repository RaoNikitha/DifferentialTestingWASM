;; 3. **Direct Call to Imported Function with Control Block and `unreachable`:**    - Design a test where a module imports a function that contains a control block (e.g., `block`, `loop`) and within that block executes `unreachable`. The importing module calls this function directly.    - **Constraint:** Checks if the trap from `unreachable` within the block correctly terminates execution without continuing any control flow in the caller.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test
      (block
        (call $external_func)
        unreachable
      )
    )
  )
  "type mismatch"
)