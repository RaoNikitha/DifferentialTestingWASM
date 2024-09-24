;; 4. **Test Case 4: `nop` in a loop construct with an `unreachable` after the loop:**    - **Constraint Checked:** `nop` should not disrupt loop iteration or final control flow.    - **Expected Behavior:** Loop iterates and then reaches `unreachable`, causing a trap.    - **Differential Behavior:** wizard_engine could improperly handle loop contexts, causing misexecution.

(assert_malformed
 (module
  (func $test-loop-nop-unreachable
   (loop
    nop
   )
   unreachable
  )
 )
 "invalid instruction sequence"
)