struct struct1{
	int i_1;
	int j_1;
};
struct struct2{
	long int i_2;
	long int j_2;
};
struct nested_struct{
	int i_3;
	struct struct1 s_1;
	struct struct2 s_2;
};
struct nested_struct init()
{
	struct nested_struct n;
	n.i_3 = 0;
	n.s_1.i_1 = 0;
	n.s_1.j_1 = 0;
	n.s_2.i_2 = 0;
	n.s_2.j_2 = 0;
	return n;
}
void modifystruct(struct nested_struct *n, int i_3, int i_1, int j_1, long int i_2, long int j_2)
{
	n->i_3 = i_3;
	n->s_1.i_1 = i_1;
	n->s_1.j_1 = j_1;
	n->s_2.i_2 = i_2;
	n->s_2.j_2 = j_2;
}
void  printstruct(struct nested_struct *n )
{
	printf("i_3 = %d, i_1 = %d, j_1 = %d, i_2 = %d, j_2 = %d\n",
			n->i_3,   
			n->s_1.i_1, 
			n->s_1.j_1,
			n->s_2.i_2,
			n->s_2.j_2);
}
int main()
{
	struct nested_struct n1, n2;
	n1 = init();
	n2 = init();
	printstruct(&n1);
	printstruct(&n2);
	modifystruct(&n1, 1, 2, 3, 4, 5);
	printstruct(&n1);
	return 0;
}
