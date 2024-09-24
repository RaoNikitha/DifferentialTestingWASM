;; 5. **Loop with Early Exit & Unreachable on Continued Execution**:    Within a loop, place a branch to break the loop early but follow the loop with an instruction sequence leading to `unreachable`, testing if breaking a loop mishandles control stack, allowing execution to reach `unreachable`.

(assert_invalid
 (module
  (func $loop-with-early-exit-unreachable
   (block
    (loop
     (br 1) ;; Early exit
     (unreachable)
    )
   )
  )
 )
 "unreachable executed"
)