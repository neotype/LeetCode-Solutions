/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count == inorder.count else {
            return nil
        }
        return _buildHelper(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }

    func _buildHelper(_ preorder:[Int], _ preStart: Int, _ preEnd:Int, 
    _ inorder:[Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        guard preStart <= preEnd && inStart <= inEnd else {
            return nil
        }

        guard let rootIndex = inorder.firstIndex(of: preorder[preStart]) else {
            return nil
        }

        let root = TreeNode(preorder[preStart])
        let leftNum = rootIndex - inStart

        root.left = _buildHelper(preorder, preStart + 1, preStart + leftNum, inorder, inStart, rootIndex - 1)
        root.right = _buildHelper(preorder, preStart + leftNum + 1, preEnd, inorder, rootIndex + 1, inEnd)

        return root
    }
}
// @lc code=end

