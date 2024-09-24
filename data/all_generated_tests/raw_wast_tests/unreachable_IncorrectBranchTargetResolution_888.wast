;; 9. **Test Complex Control Flow with Unreachable and Branch Chains:**    - Create a complex control flow where `unreachable` triggers before a series of chained `br` instructions.    - *Constraint*: Checks if each branch in the chain respects the initial trap and correctly resolves subsequent targets.    - *Relation to Branch Resolution*: Exposes issues in proper bypassing of chained branches after `unreachable`.

(assert_invalid
  (module (func $complex-control-flow-with-unreachable
    (block $outer
      (block $inner
        (unreachable)
        (br $inner)
      )
      (br $outer)
    )
  ))
  "type mismatch"
)