;; 6. **Cascading Calls with Unreachable in First Callee:**    - Create a sequence where the first module exports a function with an `unreachable` and the second module exports a function that calls the first module's export. Import the second module and call its function, checking for proper trap behavior.    - **Constraint:** Validate cascading effects of calls across multiple modules, ensuring the initial `unreachable` correctly translates to a trap through all calling contexts.

(assert_invalid
  (module (import "env" "callee" (func $callee)) 
    (func $caller 
      (unreachable) 
      (call $callee)
    )
    (export "caller" (func $caller))
  )
  "type mismatch"
)