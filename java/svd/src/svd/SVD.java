package svd;

import Jama.Matrix;
import Jama.SingularValueDecomposition;

public class SVD {
    public static void main(String[] args){
        System.out.println("test");

        // create M-by-N matrix that doesn't have full rank
        int M = 8, N = 5;
        Matrix B = Matrix.random(5, 3);
        Matrix A = Matrix.random(M, N).times(B).times(B.transpose());
        System.out.println("A = ");
        A.print(9, 6);

        // compute the singular vallue decomposition
        System.out.println("A = U S V^T");
        System.out.println();
        SingularValueDecomposition s = A.svd();
        System.out.println("U = ");
        Matrix U = s.getU();
        U.print(9, 6);
        System.out.println("Sigma = ");
        Matrix S = s.getS();
        S.print(9, 6);
        System.out.println("V = ");
        Matrix V = s.getV();
        V.print(9, 6);
        System.out.println("rank = " + s.rank());
        System.out.println("condition number = " + s.cond());
        System.out.println("2-norm = " + s.norm2());

        // print out singular values
        System.out.println("singular values = ");
        Matrix svalues = new Matrix(s.getSingularValues(), 1);
        svalues.print(9, 6);
    }
}
